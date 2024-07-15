"""
Program: Python Project.py
Author: Rudi Macdougald-Denton

1. Receive input from user to open chosen dataset file.
2. Count the number of rows in the chosen dataset file.
3. Count the number of columns in the chosen dataset file.
4. Calculate the most bought type of aircraft across the airlines.
5. Calculate the average age of the aircraft across the airlines.
6. Calculate the lowest number of aircraft bought across the airlines.
7. Calculate the highest number of aircraft bought across the airlines.
8. Receive input from user to output chosen values from the calculations in task 2 – 7 to the console.

"""

import pandas as pd

#Create a def function for dataset file used so this can be used repeatedly throughout the code
def file():
    df = pd.read_csv('Fleet Data.csv')
    pd.set_option('display.max_columns', None)
    pd.set_option('display.max_rows', None)
    pd.set_option('display.width', 0)
    return df

#Ask user if they would like to open the file
fileName = input("Would you like to open and read the Airline Fleet Dataset File? (y/n)\n")
if fileName == "y":
#Outputs file to console
    print(file())
else:
#Exits code if answer to user's question is no
    exit()

#Calculate the most commonly bought aircraft type across the airlines:
def common():
    common = file()["Aircraft Type"].mode()[0]
    return common

#Calculate the average age of the aircraft across the airlines
def average():
    average = file()["Average Age"].mean()
    return average

#Calculate the youngest aircraft across the airlines
def youngest():
    youngest = file()["Average Age"].min()
    return youngest

#Calculate the oldest aircraft across the airlines
def old():
    old = file()["Average Age"].max()
    return old

def menu():
    #Menu loop
    loop = True
    while loop:
        #Print menu
        print("Please choose one of the following options:")
        print("1. Display total number of rows in dataset.")
        print("2. Display total number of columns in dataset.")
        print("3. Display most common aircraft bought.")
        print("4. Display average age of aircraft.")
        print("5. Display the youngest age of aircraft.")
        print("6. Display the oldest age of aircraft.")
        print("7. Exit programme.\n")

        #User input to select from menu options
        choice = int(input("Enter number 1-7: \n"))

        #Display menu number selected
        if choice == 1:
            #Calculate number of rows minus the header of each column and output result
            print("The total number of rows is: ", len(file()), "\n")
        elif choice == 2:
            #Calculate the number of columns in the dataset
            print("The total number of columns in the dataset is: ", len(file().columns), "\n")
        elif choice == 3:
            #Display commonly bought aircraft
            print("Most commonly bought aircraft manufacturer and model across the airlines is ", common(), "\n")
        elif choice == 4:
            #Display average age of aircraft
            print("Average age of aircraft across the airlines is ", round(average()), "years \n")
        elif choice == 5:
            #Display youngest aircraft
            print("The youngest aircraft across the airlines is ", youngest(), "of a year old \n")
        elif choice == 6:
            #Displaye oldest aircraft
            print("The oldest aircraft across the airlines is ", round(old()), "years \n")
        elif choice == 7:
            #Exit programme
            exit()
            loop = False
        else:
            print("Please choose a valid number from the menu above. \n")
    
menu()
