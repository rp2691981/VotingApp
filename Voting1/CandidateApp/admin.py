from django.contrib import admin
from .models import CandidateLogin,CandidateProfile,CandidatePost
# Register your models here.

@admin.register(CandidateLogin)
class CandidateLoginAdmin(admin.ModelAdmin):
    list_display=['UserId','Password','StandForPosition','AccountCreated','ProfileAdded']

@admin.register(CandidateProfile)
class CandidateProfileAdmin(admin.ModelAdmin):
    list_display=['UserId','Name','Phone','Email']

@admin.register(CandidatePost)
class CandidatePostAdmin(admin.ModelAdmin):
    list_display=['CandidateUserId','Title','Image_File']

