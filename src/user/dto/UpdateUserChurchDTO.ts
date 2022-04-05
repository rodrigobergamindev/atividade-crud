import { IsNotEmpty } from "class-validator";


export class UpdateUserChurchDTO  {

    @IsNotEmpty()
    readonly name: string;

  
}