
import { CreateUserDTO } from './../dto/CreateUserDTO';
import { Injectable } from '@nestjs/common';
import * as fs from 'fs';
import * as path from 'path';
import { UpdateUserDTO } from '../dto/UpdateUserDTO';



export interface User {
  id: string;

  email: string;

  name: string;

  address: string;

}



@Injectable()
export class UserService {

  private userRepository = []
   
  constructor() {}

    async create(data: CreateUserDTO) {

      this.userRepository.push(data)

      await fs.writeFile(`C:/Users/convs/Desktop/CRUD/tmp` + "/" + "clients.json", JSON.stringify(this.userRepository, null, 2), (error) => {
        if (error) {
        console.log('An error has occurred ', error);
          return;
        }
        console.log('Data written successfully to disk');
    })

    }

    async update(data: UpdateUserDTO): Promise<void> {
     
      let userToUpdate = this.userRepository.find(client => client.id === data.id)

      userToUpdate = {...data}

      this.userRepository.push(userToUpdate)

      await fs.writeFile(`./tmp` + "/" + "clients.json", JSON.stringify(this.userRepository, null, 2), (error) => {
        if (error) {
        console.log('An error has occurred ', error);
          return;
        }
        console.log('Data written successfully to disk');
    })
      
      
    }

    async findAll(): Promise<any>{

      return new Promise(async (resolve, reject) => {
        await fs.readFile('./tmp' + "/" + "clients.json", 'utf-8', (error, data) => {
          if (error) {
          console.log('An error has occurred ', error);
            reject(error)
          }
          const clients = JSON.parse(data)
   
          resolve(clients)
      })
      
        
    })
      }

    
    
    async delete(id: string): Promise<void> {
      
    
        await fs.readFile('./tmp' + "/" + "clients.json", 'utf-8', async (error, data) => {
          if (error) {
          console.log('An error to read file has occurred ', error);
          }
          const clients = JSON.parse(data)
          this.userRepository = [...clients]
  
          const newArray = this.userRepository.filter(user => user.id !== id)
          this.userRepository = [...newArray]

          await fs.writeFile(`./tmp` + "/" + "clients.json", JSON.stringify(this.userRepository, null, 2), (error) => {
            if (error) {
            console.log('An error to write file has occurred ', error);
              return;
            }
            console.log('Data written successfully to disk');
        })

      })
      
        
   
     

    }

    async findById(id: string): Promise<any> {
      


      return new Promise(async (resolve, reject) => {
        await fs.readFile('./tmp' + "/" + "clients.json", 'utf-8', (error, data) => {
          if (error) {
          console.log('An error has occurred ', error);
            reject(error)
          }
          const clients = JSON.parse(data)
          this.userRepository = [...clients]
  
          const client = this.userRepository.find(user => user.id === id)
   
          resolve(client)
      })
      
        
    })

    }
  }