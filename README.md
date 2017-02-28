# ESUP Twitter Portlet

[![Build Status](https://travis-ci.org/Jasig/EsupTwitter.svg?branch=master)](https://travis-ci.org/Jasig/EsupTwitter)

EsupTwitter is a [JSR 286 portlet](https://jcp.org/en/jsr/detail?id=286) that allows to follow twitter timelines.

## Features

EsupTwitter enables you to display Twitter Timeline (<http://twitter.com>) of a specific user.
This user is defined in portlet preferences and can be set up when publishing portlet.
We can also let the portal user set the user that he wants to follow (EDIT mode of the portlet).
At last, and if the administrator configures EsupTwitter to allow it, the portal user can also authenticate himself on twitter so that he can follow his private timeline (for that, EsupTwitter uses Twitter oAuth authentication, see below).

## Roadmap

<https://wiki.jasig.org/display/PLT/EsupTwitter+Roadmap>

## Enable oAuth Twitter authentication (now required)

Since June 11 2013, if you want to let the portal users follow their Twitter timelines or a public user timeline, you have to register your application on Twitter: that is **required**.

Twitter lets you do this on this web site: <http://dev.twitter.com/>

Esupwitter doesn't need write permissions on Twitter, indeed we just let users read timelines, so you can set "Access Level" to read-only.

From <http://dev.twitter.com/> you must retrieve "Consumer key" and "Consumer secret". You have to put these in config file *WEB-INF/context/portlet/twitterConfig.xml*

EsupTwitter doesn't use OAuth Callback URL but this config (which can be multi-valued) let you to give domains that can host your application: during the oAuth authentication process, Twitter filters hosts with this parameter.
If you don't setup *twitterConfig.xml*, EsupTwitter will not work.

## Download

<https://github.com/Jasig/EsupTwitter/releases>

## Deployment

To deploy EsupTwitter, here the usual command line:

``` sh
ant deployPortletApp -DportletApp=/path/to/../EsupTwitter/target/esup-twitter.war
```

## Appendix

*   [French page on esup-portail.org](http://www.esup-portail.org/display/PROJESUPTWITTER/EsupTwitter)
*   [Issue Tracker](https://issues.jasig.org/browse/ETPLT)
