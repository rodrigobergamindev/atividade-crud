import { UpdateUserChurchDTO } from './../dto/UpdateUserChurchDTO';
import { CreateUserDTO } from './../dto/CreateUserDTO';
import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/service/prisma.service';
import { Ministry, PG, User, UserAddress, Church } from '@prisma/client';
import { UpdateUserDTO } from '../dto/UpdateUserDTO';
import { CreateUserAddressDTO } from '../dto/CreateUserAddressDTO';
import { UpdateUserAddressDTO } from '../dto/UpdateUserAddressDTO';



@Injectable()
export class UserService {
   
  constructor(private readonly prisma: PrismaService) {}

    async create(data: CreateUserDTO) {

     const user = await this.prisma.user.create({
       data
      })
      
      return user
      
    }

    async update(id: string, user: UpdateUserDTO): Promise<void> {
     
      await this.prisma.user.update({
        where: {
          id: id
        },
        data: {
          ...user,
        }
      })
      
      
    }

    async findAll(): Promise<User[]>{
      const users = await this.prisma.user.findMany()
    
      return users
      }

      async findByEmail(email: string): Promise<User> {
        const user = await this.prisma.user.findUnique({
          where: {
            email
          }
        })
        return user
      }
    
    
    async delete(id: string): Promise<void> {
      
      await this.prisma.user.delete({
        where: {
          id
        }
      })

    }

    async findById(id: string): Promise<User> {
      const user = await this.prisma.user.findUnique({
        where: {
            id
        }
      })
    
      return user
  
    }


    async findByName(name: string): Promise<User[]> {
      const user = await this.prisma.user.findMany({
        where: {
          name: {
            contains: name
          }
        }
      })
    
      return user
    }

    async createUserAddress(id: string, address: CreateUserAddressDTO): Promise<void>{
      await this.prisma.userAddress.create({
        data: {
          ...address, 
          user: {
            connect: {
              id
            }
          }
        },
      })
    }

    async findAddress(userId: string): Promise<UserAddress>{
      const address = this.prisma.userAddress.findUnique({
        where: {
          userId
        }
      })

      return address
    }

    async updateAddress(id: string, address: UpdateUserAddressDTO): Promise<void>{
      await this.prisma.userAddress.update({
        where: {
          id
        },
        data: {
          ...address
        }
      })
      
    }

    async deleteAddress(id: string): Promise<void>{
      await this.prisma.userAddress.delete({
        where: {
          id
        }
      })
    }

    async updateUserChurch(id: string, church: UpdateUserChurchDTO): Promise<void>{

      await this.prisma.church.update({
        where: {
          name: church.name
        },
        data: {
          members: {
            connect: {
              id
            }
          }
        }
      })
    }

    async findMinistry(userId: string): Promise<Ministry[]> {
      
      const subscriptions = await this.prisma.subscriptionMinistry.findMany({
        where: {
          memberId: userId
        }
      })

      const ministries = subscriptions.map(async (subscription) => {
        const ministry = await this.prisma.ministry.findUnique({
          where: {
            id: subscription.ministryId
          }
        })

        return ministry
      })

      const result = await Promise.all(ministries)
      return result

    }

    async findCoordinationMinistry(userId: string): Promise<Ministry[]> {

      const coordinations = await this.prisma.coordinationMinistry.findMany({
        where: {
          coordinatorId: userId
        }
      })

      const ministries = coordinations.map(async (coordination) => {
        const ministry = await this.prisma.ministry.findUnique({
          where: {
            id: coordination.ministryId
          }
        })

        return ministry
      })

      const result = await Promise.all(ministries)
      return result
    }


    async findPG(userId: string): Promise<PG>{
      const subscription = await this.prisma.subscriptionPG.findUnique({
        where: {
          memberId: userId
        }
      })

      if(subscription) {
        const pg = await this.prisma.pG.findUnique({
          where: {
            id: subscription.pgId
          }
        })
  
        return pg
      }
      
    }


    async findCoordinationPG(userId: string): Promise<PG> {

      const coordination = await this.prisma.coordinationPG.findUnique({
        where: {
          coordinatorId: userId
        }
      })

      if(coordination) {
        const pg = await this.prisma.pG.findUnique({
          where: {
            id: coordination.pgId
          }
        })
  
        return pg
      }
    }

    async findChurch(userId: string): Promise<Church> {

      const user = await this.prisma.user.findUnique({
        where: {
          id: userId
        },
        include: {
          church: true
        }
      })

      return user.church
    }


    async findAllUsersMembers(): Promise<User[]> {
      const users = await this.prisma.user.findMany({
        where: {
          NOT: {
            role: "VISITANTE"
          }
        }
      })

      return users
    }

    async findAllUsersVisitors(): Promise<User[]> {
      const users = await this.prisma.user.findMany({
        where: {
          role: "VISITANTE"
        }
      })

      return users
    }

    async findAllUsersPastor(): Promise<User[]> {
      const users = await this.prisma.user.findMany({
        where: {
          role: "PASTOR"
        }
      })

      return users
    }

    async findAllUsersDiacono(): Promise<User[]> {
      const users = await this.prisma.user.findMany({
        where: {
          role: "DIACONO"
        }
      })

      return users
    }

    async findAllUsersPresbitero(): Promise<User[]> {
      const users = await this.prisma.user.findMany({
        where: {
          role: "PRESBITERO"
        }
      })

      return users
    }

    async findAllUsersMissionario(): Promise<User[]> {
      const users = await this.prisma.user.findMany({
        where: {
          role: "MISSIONARIO"
        }
      })

      return users
    }

    async findAllUsersEvangelista(): Promise<User[]> {
      const users = await this.prisma.user.findMany({
        where: {
          role: "EVANGELISTA"
        }
      })

      return users
    }

    

}
