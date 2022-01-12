from django.contrib import admin
from .models import Ad_DirectComplain,ElectionPostion,PositionBlock,AdminApplicationForm
from .models import Voting

# Register your models here.
@admin.register(Ad_DirectComplain)
class Ad_DirectComplainAdmin(admin.ModelAdmin):
    list_display=['id','ComplainFrom_UserId','ComplainFor','Subject','Description']

@admin.register(ElectionPostion)
class ElectionPositionAdmin(admin.ModelAdmin):
    list_display=['Position','PostionTimeCreated']


@admin.register(PositionBlock)
class PositionBlockAdmin(admin.ModelAdmin):
    list_display=['position','CandidateUserId']

@admin.register(AdminApplicationForm)
class AdminApplicationFormAdmin(admin.ModelAdmin):
    list_display=['id','Name','StandPosition','email']


@admin.register(Voting)
class VotingAdmin(admin.ModelAdmin):
    list_display=['id','position','CandidateUserId','StudentId','Studentvotingtime']
