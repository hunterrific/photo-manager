# Photo Manager

project name: photo-manager

##Description

I need something to help me manage my photos specific to my needs.  I am not satisfied with the options that are available online, so why not make one myself.

Needs to be able to:

* Download all images at a URL (I don't want to have to download manually).
* Process all images in a folder and tag appropriately using the folder name and a metadata file.
* Allow tagging, rating, and commenting.
* Save all relevant files on a USB drive for backup.

Mainly, I'm not happy with the options available online because:

1.  It's difficult to back up the files.
2.  The service might be canceled at any time (even if I pay for something).
3.  It's difficult to sort and group photos in different ways.
4.  I can't be certain that my photos are kept private.

Also, this would be a good chance to refine existing skills and learn some new skills:

* Use MongoDB to store image metadata.
* Use NodeJS, ExpressJS, and CoffeeScript to create a REST API for the metadata.
* Use VueJS for frontend.
  * May use AngularJS v2 later (with material design).

Once things are working, can also:

* Learn how to implement frontend/backend in Grails, Java, Python, etc.
* Create new frontends using the REST API.

##Notes

* Switched back to Ubuntu 14.04 (Trusty) since 16.04 not yet officially listed as supporeted by NodeJS.
* Using the vagrant-boilerplate (messed this up initially, so I'll have write down how to do this properly).
* Can create an UI similar to danbooru image boards initially and go from there.
* Backend will use CoffeeScript for now
* Multiple versions of frontend (communicate with backend via API; should be decoupled)
  * HTML + JavaScript
  * PUG + CoffeeScript
* Created private folder to store temporary scripts that are useful for development tasks.  Should not be part of project.
