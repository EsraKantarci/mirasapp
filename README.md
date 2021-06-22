
# Legal Inheritance Share Calculator App


[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]



<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/esrakantarci/mirasapp">
    <img src="https://github.com/EsraKantarci/mirasapp/blob/master/assets/images/mid.png" alt="Logo">
  </a>

  <h3 align="center"> Miras Payı Hesaplayıcı App</h3>

  <p align="center">
    A new Flutter application on calculating the rates of legal the inheritors and informing people who seeks knowledge on Inheritance Law. 
  
  The rules will be under Turkish Civil Code's orders. The UI will be consist of 5 different view: disclaimer, home, blog, forms and calculation output. 
  It aims to help people on inheritance related legal procedures.

Mockups were designed on Balsamiq Wireframe tool. You can find them in /mockup directory.  
    <br />
    <a href="https://github.com/EsraKantarci/mirasapp/tree/master/documentation"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/EsraKantarci/mirasapp/">View Demo</a>
    ·
    <a href="https://github.com/EsraKantarci/mirasapp/issues">Report Bug</a>
    ·
    <a href="https://github.com/EsraKantarci/mirasapp/issues">Request Feature</a>
  </p>
</p>



<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary><h2 style="display: inline-block">Table of Contents</h2></summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
      </ul>
    </li>
    <li><a href="#howtouse">How to use?</a></li>
    <li><a href="#demo">Demo</a></li>
    <li><a href="#future-work">Future Work</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgements">Acknowledgements</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

The application is to give knowledge about their legal rights to people at the point of inheritance sharing and to inform people about inheritance law. The calculation rules of this application have been developed on the basis of the 495th article of the Turkish Civil Code and the following rules. Our application is for informational purposes only, it is not legally binding.


### Built With

* [Flutter SDK ^2.7.0](Flutter.dev)
* [Dart](dart.dev)
* [Android Studio](https://developer.android.com/studio)
* [Flutter_spinbox:  ^0.5.2](https://pub.dev/packages/flutter_spinbox)
* [Material Design](https://material.io/develop/flutter)


<!-- GETTING STARTED -->
## Getting Started

### Why Flutter?

Flutter is a highly responsive Cross-Platform UI development tool and the project can be used in Android, iOS and Web at the same time. 

This is my first Flutter application, and even though I stressed out very much (because I did not know the Dart language or familiar with Flutter) the project resulted overall beyond my expectations. Therefore, Flutter is also a easy-to-adapt technology, if you are familiar with other programming languages. 

One of the good advantages of the Flutter is "Hot Reload" feature, which saves a lot of time during the restarts. It is really fast and the changes can be shown at the moment you press Ctrl+S. 

## Configuration Steps
1. Cloning the repository:

```
$ git clone https://github.com/esrakantarci/mirasapp.git
```

2. Open the project and install dependencies (using terminal):

```
$ cd miras
$ flutter pub get
```
This installs all the required dependencies like shared_preferences, cupertino_icons, flutter_spinbox, grouped_list, image_picker etc...

3. Make sure you enable virtualization for AVD, follow the mentioned steps and you're good to go. You can also use Chrome or Edge as web browser. 

4. Now run the app on your connected device (using terminal):

`$ flutter run`


## How to Use?: 

<img src="https://github.com/EsraKantarci/mirasapp/blob/master/assets/images/1.png" width="300"> 

First, enter the name of the inheritor. This will help you in the next pages. Do not worry, any data you enter is not stored by us. When you exit the application calculation screen, all the data you have entered is deleted.
If the inheritor has a living spouse at the time of his death, select "Yes". If the inheritor is married, but the spouse died before the inheritor, you must tick the "No" option. 


<img src="https://github.com/EsraKantarci/mirasapp/blob/master/assets/images/2.png" width="300">

If they are divorced, the divorced spouse will not inherit (if there is no such clause in the will) since he is not legally considered his wife. Therefore, again select the option "No".

What is meant by "Descendants" is children and their children. Adoption is also counted as a child. If there is even one living subline, please tick “Yes”.

If the legator has descendants, you must include the number of all children (including dead children) of the legator on the next page 2. If you want convenience, you can not include people who have no descendants (i.e. no children/grandchildren, etc.) among the dead children, as they will not inherit.

<img src="https://github.com/EsraKantarci/mirasapp/blob/master/assets/images/3.png" width="300">

If the legator has descendants, you must include the number of all children (including dead children) of the legator on the next page 2. If you want convenience, you can not include people who have no descendants (i.e. no children/grandchildren, etc.) among the dead children, as they will not inherit.

If the inheritor has no descendants, the inheritance passes to the next class, the upper lineage. What is meant by superline is the mother, father and their children of the inheritor. If both parents are dead, tick “No”. Otherwise, select “Yes”.

The children of the parents of the legator or the children of the children of the parents (for example, nephews) fall into this category. If there is at least one living parent descendant, please tick “Yes”. Otherwise, select "No".

<img src="https://github.com/EsraKantarci/mirasapp/blob/master/assets/images/4.png" width="300">

If there is no heir candidate living in the second group, the inheritance is passed on to the grandparents (grandmother, paternal grandfather) and their descendants, who are super descendants. If there is at least one heir living at this stage, please tick “Yes” for the relevant option.

Regardless of which faction, when adding heirs, you are expected to enter the names of the parents who died first. Then, enter the number of children of this person and click on the "Save this person to the list" text. When you click, the text on the button will change to “This person has been saved” and the “?” in the upper right. mark will turn into a tick mark. This means that the contact is registered.

The name of the deceased parent, who transferred the inheritance share to the person, is located in the upper left part of these person addition forms as "Parent's name".


<img src="https://github.com/EsraKantarci/mirasapp/blob/master/assets/images/5.png" width="300">

### Note:
We need to make an explanation regarding the descendants of the second and third groups as follows: if both parents are dead, you will have to enter the same person separately for both parents, since they will inherit separately from both. Since double kinship is also discussed in this application, it is necessary to add people to their parents separately. Again, the flow of the application was arranged in this way because of the possibility of parents marrying other people and having children from others.

## Demo

<img src="https://github.com/EsraKantarci/mirasapp/blob/master/Animation.gif"> 

## Future Work

The project will be put into PlayStore and AppStore for people to use. However, before submitting the project into the public access, there are some steps which needs to be taken care of:

* Validator: The textfields validations were not implemented yet.
* Modification in the Person Forms: The person forms can be changed once user hit the "Save to the list" button, but eventually it adds up as a new person. But, it should actually modify the person card.
* Downloading the result page: Although users now can use screenshots to save the result, we can implement a downloadable version of the form. 
* Stress testing
* Loggers

And there are some future view changes which are not business related, but good for the user:

* Knowledgebase and searchbar: The blogs should be listed as a big long vertical list and a search bar should be implemented for users to be able to easily access the content. 
* Blog context: The texts inside the blog is not mine, so it is a subject to copyright-permissions. I will be adding original content and petitions for users to use.
* Downloading the petitions: Example petitions can be downloaded, this implementation can be done once I write down the example petitions by myself for original content. 

## Screenshots 
<img src="https://github.com/EsraKantarci/mirasapp/blob/master/new-screens/disclaimer.png" width="216" height="380"> <img src="https://github.com/EsraKantarci/mirasapp/blob/master/new-screens/home.png" width="216" height="380">
<img src="https://github.com/EsraKantarci/mirasapp/blob/master/new-screens/blog.png" width="216" height="380">
 <img src="https://github.com/EsraKantarci/mirasapp/blob/master/new-screens/1.png" width="216" height="380">
<img src="https://github.com/EsraKantarci/mirasapp/blob/master/new-screens/4.png" width="216" height="380"><img src="https://github.com/EsraKantarci/mirasapp/blob/master/new-screens/6.png" width="216" height="380">
<img src="https://github.com/EsraKantarci/mirasapp/blob/master/new-screens/11.png" width="216" height="380"> 
<img src="https://github.com/EsraKantarci/mirasapp/blob/master/new-screens/12.png" width="216" height="380"> <img src="https://github.com/EsraKantarci/mirasapp/blob/master/new-screens/13.png" width="216" height="380">

<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.



<!-- CONTACT -->
## Contact

Esra Kantarcı Çayır - [@Ornitorenkus](https://instagram.com/ornitorenkus) - av.esrakantarci@gmail.com

Project Link: [https://github.com/esrakantarci/mirasapp](https://github.com/esrakantarci/mirasapp)



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/esrakantarci/mirasapp.svg?style=for-the-badge
[contributors-url]: https://github.com/esrakantarci/mirasapp/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/esrakantarci/mirasapp.svg?style=for-the-badge
[forks-url]: https://github.com/esrakantarci/mirasapp/network/members
[stars-shield]: https://img.shields.io/github/stars/esrakantarci/mirasapp.svg?style=for-the-badge
[stars-url]: https://github.com/esrakantarci/mirasapp/stargazers
[issues-shield]: https://img.shields.io/github/issues/esrakantarci/mirasapp.svg?style=for-the-badge
[issues-url]: https://github.com/esrakantarci/mirasapp/issues
[license-shield]: https://img.shields.io/github/license/esrakantarci/mirasapp.svg?style=for-the-badge
[license-url]: https://github.com/EsraKantarci/mirasapp/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://tr.linkedin.com/in/esra-kantarc%C4%B1-%C3%A7ay%C4%B1r-b1948454

<!--Reference: https://github.com/othneildrew/Best-README-Template -->
