
import {
    Prisma
  } from '@prisma/client';
import { IsNotEmpty, IsPostalCode } from 'class-validator'


export class CreateUserAddressDTO implements Prisma.UserAddressCreateInput  {

  @IsNotEmpty()
  readonly place: string;

  @IsNotEmpty()
  readonly number: string;

  readonly complement?: string;

  @IsPostalCode('BR')
  readonly zipCode: string;

  @IsNotEmpty()
  readonly district: string;

  @IsNotEmpty()
  readonly city: string;

  @IsNotEmpty()
  readonly country:  string;  
  
  readonly user: Prisma.UserCreateNestedOneWithoutAddressInput;
}