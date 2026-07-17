import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { UsersModule } from './users/users.module';
import { TicketsModule } from './tickets/tickets.module';
import { IdentityModule } from './identity/identity.module';
import { AssetsModule } from './assets/assets.module';
import { NotificationsModule } from './notifications/notifications.module';
import { ReportsModule } from './reports/reports.module';

@Module({
  imports: [UsersModule, TicketsModule, IdentityModule, AssetsModule, NotificationsModule, ReportsModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
