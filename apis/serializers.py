from django.contrib.auth.models import User

from rest_framework import serializers
from apis.models import *

class UserSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = User
        fields = '__all__'

class MovieSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = Movie
        fields = '__all__'

class CinemaHallSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = Cinema_Halls
        fields = '__all__'

class CinemaHallMovieSerializer(serializers.ModelSerializer):
    cinema_halls = CinemaHallSerializer()
    movie = MovieSerializer()
    class Meta:
        model = Cinema_Hall_Movies
        fields = '__all__'

class ScreenSerializer(serializers.ModelSerializer):
    cinema_halls = CinemaHallSerializer()
    class Meta:
        model = Screens
        fields = '__all__'

class MovieScreenSerializer(serializers.ModelSerializer):
    movie = MovieSerializer()
    screens = ScreenSerializer()
    class Meta:
        model = MovieScreens
        fields = '__all__'

class MovieScreenTimeSerializer(serializers.ModelSerializer):
    class Meta:
        model = MovieScreenTime
        fields = '__all__'

class BookingSerializer(serializers.ModelSerializer):
    user = UserSerializer()
    movie_screens = MovieScreenSerializer()
    movie_screen_time = MovieScreenTimeSerializer()
    class Meta:
        model = Bookings
        fields = '__all__'