# Garmin Connect Onebox

Onebox to embed Garmin courses and activitie in Discourse. Usefull for runner communities.

### Supported URL for embeds
 - https://connect.garmin.com/activity/ID
 - https://connect.garmin.com/modern/activity/ID
 - https://connect.garmin.com/modern/course/ID
 - https://connect.garmin.com/course/ID

## Installation

Add the plugin's repo url to your container's app.yml file

```yml
hooks:
  after_code:
    - exec:
        cd: $home/plugins
        cmd:
          - mkdir -p plugins
          - git clone https://github.com/discourse/docker_manager.git
          - git clone https://github.com/mrloop/garmin_connect_onebox.git
```
* Rebuild the container and restart the application

```
cd /var/docker
./launcher rebuild app
./launcher restart app
```

## Update existing posts
```
rake posts:refresh_oneboxes
```

## Screenshots
