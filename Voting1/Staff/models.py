from django.db import models

# Create your models here.

#UserLoginCheck
class StaffLogin(models.Model):
    UserId=models.CharField(max_length=150,primary_key=True)
    Password=models.CharField(max_length=100)  
    StaffActive=models.CharField(max_length=10,default='1')  #if its be 0 than the account banned by Admin
    AccountCreated=models.DateTimeField(auto_now=True)


class StaffProfile(models.Model):
    UserId=models.OneToOneField(StaffLogin,on_delete=models.CASCADE,primary_key=True)
    Name=models.CharField(max_length=100,default='Enter your Name')
    Phone=models.CharField(max_length=20,default='Add Number')
    AlternateNumber=models.CharField(max_length=25,default='Alternate Number')
    Email=models.EmailField(max_length=100,default='User@example.com')
    Gender=models.CharField(max_length=19,default='gender!') 
      
#AddedByAdmin=models.CharField(max_length=25,default='Alternate Number')
