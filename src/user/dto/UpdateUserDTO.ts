import { IsEmail, IsNotEmpty, IsPhoneNumber } from 'class-validator';

import {
    Prisma, Role
  } from '@prisma/client';



export class UpdateUserDTO implements Prisma.UserUpdateInput {

  @IsPhoneNumber('BR')
  readonly phoneNumber: string;

  @IsEmail()
  readonly email: string;

  @IsNotEmpty()
  readonly name: string;

  @IsNotEmpty()
  readonly role: Role;

  @IsNotEmpty()
  readonly birth: string;
  
  readonly photoUrl?: string;

}