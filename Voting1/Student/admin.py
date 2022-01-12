from django.contrib import admin
from .models import UserLogin,UserProfile

# Register your models here.
#user block
@admin.register(UserLogin)
class UserLoginAdmin(admin.ModelAdmin):
    list_display=['UserId','Password','AccountCreated','ProfileAdded']
@admin.register(UserProfile)
class UserProfileAdmin(admin.ModelAdmin):
    list_display=['UserId','Name','Phone','Email']
