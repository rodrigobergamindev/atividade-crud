import { RolesGuard } from './../../auth/roles/roles.guard';
import { AuthModule } from './../../auth/auth.module';
import { Module } from '@nestjs/common';
import { UserController } from '../controller/user.controller';
import { UserValidationExistPipe, UserValidationAlreadyExistPipe, UserValidationAddressExist} from '../pipes/UserValidationPipe';
import { UserService } from '../service/user.service';




@Module({
  imports: [AuthModule],
  controllers: [UserController],
  providers: [UserService,
    UserValidationExistPipe, 
    UserValidationAlreadyExistPipe,
    UserValidationAddressExist,
    RolesGuard
  ]
})
export class UserModule {}