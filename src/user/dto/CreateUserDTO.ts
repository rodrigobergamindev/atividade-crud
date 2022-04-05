
import {
    Prisma, Role
  } from '@prisma/client';
import { IsEmail, IsNotEmpty, IsOptional, IsPhoneNumber, IsUrl, MinLength } from 'class-validator'


export class CreateUserDTO implements Prisma.UserCreateInput {

  @IsNotEmpty()
  readonly id: string;

  @IsPhoneNumber('BR')
  readonly phoneNumber: string;

  @IsEmail()
  readonly email: string;

  @IsNotEmpty()
  readonly name: string;

  @IsNotEmpty()
  readonly role: Role;
  
  @IsNotEmpty()
  @MinLength(6)
  readonly password: string;
 
  readonly birth: string;

  @IsUrl()
  @IsOptional()
  readonly photoUrl?: string;
}