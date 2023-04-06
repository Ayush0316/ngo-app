# <div align="center"> Google Solution Challenge 2023 - Careezy</div>

# Table of Contents
1. [ Problem Statement ](#problemstatement)
2. [ Solution ](#solution)
3. [ Sustainable Development Goals ](#goals)
4. [ How app deals with sustaianable goals? ](#deal)
5. [ SetUp on local env. ](#setup)
6. [Work Flow](#workflow)
7. [ Directory Structure ](#structure)
8. [ Demo Video ](#demoVideo)
9. [Developers](#developers)

<a name="problemstatement"></a>
# Problem Statement
Distributed data and information for the donators is a big problem. One who wants to contribute in NGOs in the form of wealth, food, cloth, shelter and many more needs to crawl over the entire web to find the best NGOs of their interest. No single site solution is available to them. 

Also sometimes, people voluntary want to contribute for some good cause by forming community among some stranger people with same interest, but no app or website deals with this problem.

According to the <a href="https://www.unv.org/power-volunteerism">UN Volunteers</a> more than 1 billion people voluntary contribute to society, majorly serving in thier own countries. We can expect there is huge capability in volunteerism which is not exploited yet because of lack of any medium to join people together.

<b>Hence we come up with the solution for these problems.</b>

<br>

<a name="solution"></a>
# Solution
Our app deals with both these problems together and provide the users interface, where all the NGOs are listed. User can choose the NGO of his/her interest and contribute further. In same way the voluntary communities opened at this time are visible to them on the interface where all the regarding information is provided. User can then choose among them to volunteer. 

<br>

<a name="goals"></a>
# Sustainable Development Goals
The central UN Sustainable Development Goals and targets we choose for our solution are:-
<ul>
    <li><a href="https://sdgs.un.org/goals/goal2">Zero Hunger</a></li>
    <li><a href="https://sdgs.un.org/goals/goal3">Good Health and Well-being></a></li>
<li><a href="https://sdgs.un.org/goals/goal4">Quality Education</a></li>
<li><a href="https://sdgs.un.org/goals/goal16">Peace, justice and strong institutions</a></li>
</ul>
The inspiration to choose these SDGs was the fact that we, the world, have enough resources it needs to sustain all people of the world comfortably for the time being, be it food for all, health services for all, quality education for all, sanitation for all but the sole drawback is the inability of these resources to reach the people in need and unjustified distribution so if like-minded people decide to share their resources and talents we think, hunger, poverty, illiteracy, inadequate health services can be reduced. Also, after being supported, the vulnerable communities can have a better chance at growing and being part of the system to their total capacity.

<br>

<a name="deal"></a>
# How our app deals with these Sustainable goals?
As a teenager and social problems conscious, we always keep looking for a single site where all the details related to NGOs will be found, so it will be easy for us to contribute and donate. With the help of this we make partnerships among the donators and NGOs.

<b><u> We know many sites already of such type exist, but what's different in ours? </u></b>

Our app has an additional feature of community build-up. Many students, and teenagers are constantly looking for opportunities where they can volunteer part-time for some good cause. So our app is solving this problem by bringing people from all over the world to single app and form community according to their interests.

<br>

<a name="setup"></a>
# SetUp on local env.
1. Fork the repo and clone all the files.

    1. Open the folder in the terminal in which you want to clone the project 
    ```
    $ cd folder_name
    ```
    ```
    $ git clone https://github.com/Ayush0316/ngo-app.git
    ```
    
    a folder by the name ngo-app will be visible</br>
    
    2. open the main folder 
    ```
    $ cd ngo_app
    ```
    
2. Run the project </br>
    ***Install the flutter extension***</br>
    Run ***Flutter pub get*** to install all the dependencies<br>
    Now either by using an emulator or physical device run the app by the command 
    ```
    flutter run
    ```
<br>

<b>All done, now you should be able to see the login screen in your emulator.</b>

<br>

<h3><u>Only available for android as for now</u></h3>
<br>

<a name="workflow"></a>
# Work Flow
|   S.No        |   Features        |
|   --------    |   -------------   |
|    1.         | Any user can login and register to the app simply using email and password and some basic information                  |
| 2.    | Logged in user have options to explore NGOs and communities to choose of his/her interest |
| 3. | User who wants to contribute can simply click on button provided for each community/NGO which gives notification to concerned authorities and their contact information is shared.   |
| 4. | User can chat to the community owners/ NGOs through chatbot provided in app |
| 5. | Regular notifications to user regarding new contributions needed or communities. |
| 6. | Any user can themselves too create community | 
| 7. | Recommendations to the user on the basis of previous contributions |

<br>

<a name="structure"></a>
# Directory Structure
```
ngo-app
|--- ngo_app
|    |--- assets               # All assets of app like recommendation models
|    |--- images               # All images used in app(static files) 
|    |--- lib
|    |    |--- modals          # All modals used in the app.
|    |    |--- screen          # All screens used in the app.
|    |    |--- services        # ML and firebase related functions.
|    |--- public
|    |    |--- index.html
|    |--- pubspec.yaml          # yaml file for the app
```

<br>

<a name="demoVideo"></a>
# Demo Video

https://user-images.githubusercontent.com/100359818/229307134-77fb2ad2-4cd8-45f9-b69c-9f3874e99fff.mp4

<br>

<a name="developers"></a>
# Developers
<a href="https://github.com/Ayush0316">![avatar](https://images.weserv.nl/?url=avatars.githubusercontent.com/u/95131125?v=4&h=80&w=80&fit=cover&mask=circle&maxage=7d)</a>
<a href="https://github.com/Sehaj-kahlon/">![avatar](https://images.weserv.nl/?url=avatars.githubusercontent.com/u/114355575?v=4&h=80&w=80&fit=cover&mask=circle&maxage=7d)</a>
<a href="https://github.com/Sar-thak-3">![avatar](https://images.weserv.nl/?url=avatars.githubusercontent.com/u/100359818?v=4&h=80&w=80&fit=cover&mask=circle&maxage=7d)</a>
<a href="https://github.com/NamanGoyal9102">![avatar](https://images.weserv.nl/?url=avatars.githubusercontent.com/u/122034533?v=4&h=80&w=80&fit=cover&mask=circle&maxage=7d)</a>
