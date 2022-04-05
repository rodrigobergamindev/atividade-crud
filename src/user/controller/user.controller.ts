import { RolesGuard } from '../../auth/roles/roles.guard'
import { Roles } from '../../auth/roles/decorator/roles.decorator'

import { UpdateUserChurchDTO } from './../dto/UpdateUserChurchDTO';

import { UserService } from './../service/user.service';
import { Controller, Post, Get, Body, UsePipes, ValidationPipe, Delete, Param, NotFoundException, Put, UseGuards, Req, Res } from '@nestjs/common';
import { CreateUserDTO } from '../dto/CreateUserDTO';
import { UserValidationAddressExist, UserValidationAlreadyExistPipe, UserValidationExistPipe } from '../pipes/UserValidationPipe';
import { User, UserAddress, Ministry, PG, Church } from '@prisma/client';
import { CreateUserAddressDTO } from '../dto/CreateUserAddressDTO';
import { UpdateUserAddressDTO } from '../dto/UpdateUserAddressDTO';
import { UpdateUserDTO } from '../dto/UpdateUserDTO';
import { AuthGuard } from '@nestjs/passport';
import { Role } from 'src/auth/roles/roles.enum';
import {Request, Response} from 'express'





@Controller('api/users')
export class UserController {

    constructor(private readonly userService: UserService) {}
    
    @Get()
        async getUsers(): Promise<User[]>{
            const users = await this.userService.findAll();
            return users
        }

    
    @Get('id/:id')
    async getUserById(
        @Param('id') id : string): Promise<User> {
            const user = await this.userService.findById(id)
            if(!user) throw new NotFoundException({statusCode: 404, message: "User Not Found"})
            return user
        }    
    
    @Get('name/:name')
    async getUserByName(
        @Param('name') name : string): Promise<User[]> {
            const user = await this.userService.findByName(name)
            
            return user
        }    


    @Post()
    @UsePipes(ValidationPipe, UserValidationAlreadyExistPipe)
    async create(
        @Body() user: CreateUserDTO): Promise<void>{
            await this.userService.create(user)
    }

    @UseGuards(AuthGuard('jwt'))
    @Put(':id')
    async update(
      @Param('id', UserValidationExistPipe) id: string, @Body() user: UpdateUserDTO): Promise<void>{
           await this.userService.update(id, user)
    }

    
    @UseGuards(AuthGuard('jwt'), RolesGuard)
    @Roles(Role.ADMIN)
    @Delete(':id')
    async deleteUser(
        @Req() req : Request,
        @Param('id', UserValidationExistPipe) id : string): Promise<void> {
          
            await this.userService.delete(id)
        }

  @UseGuards(AuthGuard('jwt'))
  @Put(':userId/church')
    @UsePipes(ValidationPipe)
    async updateChurch(
        @Param('userId', UserValidationExistPipe) userId: string, 
        @Body() church: UpdateUserChurchDTO
    ): Promise<void>{
        
        await this.userService.updateUserChurch(userId, church)
  }

  @Get(':userId/church')
  async getChurch(
      @Param('userId') userId: string
  ): Promise<Church>{
      const church = await this.userService.findChurch(userId)
      if(!church) throw new NotFoundException({statusCode: 400, message: "Usuário não faz parte de nenhuma igreja"})
      return church
}

  @UseGuards(AuthGuard('jwt'))
  @Post(':userId/address')
  @UsePipes(ValidationPipe)
  async createAddress(
      @Param('userId', UserValidationExistPipe) userId: string, 
      @Body() address: CreateUserAddressDTO
  ): Promise<void>{
       await this.userService.createUserAddress(userId, address)
}
  
  @UseGuards(AuthGuard('jwt'))
  @Put('address/:addressId')
  @UsePipes(ValidationPipe)
  async updateAddress(
      @Param('addressId', UserValidationAddressExist) addressId: string, 
      @Body() address: UpdateUserAddressDTO
  ): Promise<void>{
      
      await this.userService.updateAddress(addressId, address)
}

    @UseGuards(AuthGuard('jwt'))
    @Delete('address/:addressId')
    async deleteAddress(
        @Param('addressId', UserValidationAddressExist) addressId: string
    ): Promise<void>{
        
        await this.userService.deleteAddress(addressId)
  }
  
  @UseGuards(AuthGuard('jwt'))
  @Get(':userId/address')
  async getAddress(
      @Param('userId') userId: string
  ): Promise<UserAddress>{
      const address = await this.userService.findAddress(userId)
      if(!address) throw new NotFoundException({statusCode: 404, message: "Endereço não encontrado para este usuário"})
      return address
}   

  
  @Get(':userId/ministry')
  async getMinistryToUser(
      @Param('userId') userId: string
  ): Promise<Ministry[]>{
      const ministry = await this.userService.findMinistry(userId)
    
      if(ministry.length === 0) throw new NotFoundException({statusCode: 404, message: "Usuário não faz parte de nenhum ministério"})
      return ministry
}

  @Get(':userId/ministry/coordination')
  async getMinistryCoordination(
    @Param('userId') userId: string
    ): Promise<Ministry[]>{
    const ministry = await this.userService.findCoordinationMinistry(userId)
  
    if(ministry.length === 0) throw new NotFoundException({statusCode: 404, message: "Usuário não lidera nenhum ministério"})
    return ministry
}

    @Get(':userId/pg')
    async getPGToUser(
        @Param('userId') userId: string
        ): Promise<PG>{
        const pg = await this.userService.findPG(userId)
      
        if(!pg) throw new NotFoundException({statusCode: 404, message: "Usuário não participa de nenhum PG"})
        return pg
    }

    @Get(':userId/pg/coordination')
    async getPGCoordination(
        @Param('userId') userId: string
        ): Promise<PG>{
        const pg = await this.userService.findCoordinationPG(userId)
      
        if(!pg) throw new NotFoundException({statusCode: 404, message: "Usuário não lidera nenhum PG"})
        return pg
    }


    /**USERS BY ROLE */

    @Get()
        async getPastores(): Promise<User[]>{
            const users = await this.userService.findAllUsersPastor()
            return users
        }

    @Get()
        async getEvangelistas(): Promise<User[]>{
            const users = await this.userService.findAllUsersEvangelista()
            return users
        }

    @Get()
        async getPresbiteros(): Promise<User[]>{
            const users = await this.userService.findAllUsersPresbitero()
            return users
        }

    @Get()
        async getMissionario(): Promise<User[]>{
            const users = await this.userService.findAllUsersMissionario()
            return users
        }
    
    @Get()
        async getDiaconos(): Promise<User[]>{
            const users = await this.userService.findAllUsersDiacono()
            return users
        }

    @Get()
        async getAllMembers(): Promise<User[]>{
            const users = await this.userService.findAllUsersMembers()
            return users
        }
    
    @Get()
        async getAllVisitors(): Promise<User[]>{
            const users = await this.userService.findAllUsersVisitors()
            return users
        }

}
