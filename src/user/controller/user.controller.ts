
import { UserService } from './../service/user.service';
import { Controller, Delete, Get, NotFoundException, Param, Patch, Post,  Req } from '@nestjs/common';
import {User} from '../service/user.service'




@Controller('api')
export class UserController {

    constructor(private readonly userService: UserService) {}
    
    @Get('/clients')
        async getUsers(): Promise<User[]>{
            const users = await this.userService.findAll()
            if(!users) throw new NotFoundException()
            return users
        }

    
    @Get('client/:id')
    async getUserById(
        @Param('id') id : string): Promise<User> {
          const user = await this.userService.findById(id)
          if(!user) throw new NotFoundException()
          return user
        }    
     


    @Post('/client/:id/:nome/:endereco/:email')
    async create(
        @Param('id') id : string,
        @Param('nome') name : string,
        @Param('endereco') address : string,
        @Param('email') email : string,
        ): Promise<void>{

            const user = {id,name,address,email}
            await this.userService.create(user)
    }

    
    @Patch('/client/:id/:nome/:endereco/:email')
    async update(
        @Param('id') id : string,
        @Param('nome') name : string,
        @Param('endereco') address : string,
        @Param('email') email : string,
        ): Promise<void>{
            const user = {id,name,address,email}

          await this.userService.update(user)
    }

    

    @Delete('/client/:id')
    async deleteUser(
        @Param('id') id : string): Promise<void> {
          
            await this.userService.delete(id)
        }

    }