from django.db import models

# Create your models here.

#UserLoginCheck
class CandidateLogin(models.Model):
    UserId=models.CharField(max_length=150,primary_key=True)
    Password=models.CharField(max_length=100)  
    StandForPosition=models.CharField(max_length=200)
    ProfileAdded=models.CharField(max_length=100,default='name')
    AccountCreated=models.DateTimeField(auto_now=True)


class CandidateProfile(models.Model):
    UserId=models.OneToOneField(CandidateLogin,on_delete=models.CASCADE,primary_key=True)
    Name=models.CharField(max_length=100,default='Enter your Name')
    Phone=models.CharField(max_length=20,default='Add Number')
    AlternateNumber=models.CharField(max_length=25,default='Alternate Number')
    Email=models.EmailField(max_length=100,default='User@example.com')
    Gender=models.CharField(max_length=19,default='gender!')    


class CandidatePost(models.Model):
    CandidateUserId=models.ForeignKey(CandidateLogin,on_delete=models.CASCADE)
    Title=models.CharField(max_length=200)
    Description=models.CharField(max_length=900)
    Image_File=models.FileField(upload_to="Post/",max_length=600,default=None)