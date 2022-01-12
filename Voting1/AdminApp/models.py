from django.db import models
from django.db.models.base import Model

# Create your models here.
class Ad_DirectComplain(models.Model):
    ComplainFrom_UserId=models.CharField(max_length=150)
    UserEmail=models.EmailField(max_length=200,default='User@example.com')
    ComplainFor=models.CharField(max_length=200)  
    Subject=models.CharField(max_length=300,default='Empty')
    Description=models.CharField(max_length=850)    
    ComplainTime=models.DateTimeField(auto_now=True)



class ElectionPostion(models.Model):
    Position=models.CharField(max_length=150,primary_key=True)
    PostionTimeCreated=models.DateTimeField(auto_now=True)



class PositionBlock(models.Model):
    position=models.ForeignKey(ElectionPostion,on_delete=models.CASCADE)
    CandidateUserId=models.CharField(max_length=100,unique=True)

class Voting(models.Model):
    position=models.ForeignKey(ElectionPostion,on_delete=models.CASCADE)
    CandidateUserId=models.CharField(max_length=100)
    StudentId=models.CharField(max_length=150)
    Studentvotingtime=models.DateTimeField(auto_now=True)
    

class AdminApplicationForm(models.Model):
    Name=models.CharField(max_length=150)
    phone=models.CharField(max_length=20)
    email=models.EmailField(max_length=200)
    gender=models.CharField(max_length=20)
    StandPosition=models.CharField(max_length=200)