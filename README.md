# place-update-trigger

Cronjob that runs a bash script when a Roblox experience has been updated.

Useful for for example triggering your CI pipelines after builders save their 
progress.

## Prerequisites

* [Docker][1]
* Or, **if your host machine supports cron**: [bash][2], [coreutils][3], 
  [curl][4] and [jq][5] (of which some may have been installed by default).

## Installation

1. Copy `.env.example` to `.env` and enter the fields. If you're going to use 
   the `trigger_github_actions` action, uncomment all those variables. See the 
   [GitHub Docs][2] for what each variable entails.
2. To build the Docker image, execute:
   ```
   docker build . -t experience-update-trigger
   ``` 
3. To run the built image in a container, execute:
    ```
    docker run --env-file .env experience-update-trigger <ACTION_NAME>
    ```
    With `ACTION_NAME` being the name of the script in [actions][7] you want the
    cronjob to run when an update has been detected. This defaults to 
   `trigger_github_actions`

## Note

The cronjob also triggers on AutoSaves. 

If in the future I find a better endpoint that for example includes information 
about when a game has lastly been**published**, this project could be improved 
to using that. If you happen to know such endpoint on the Roblox API, feel free 
to open an [issue][8]!

[1]: https://docs.docker.com/get-docker/
[2]: https://www.gnu.org/software/bash/
[3]: https://www.gnu.org/software/coreutils/
[4]: https://curl.se/download.html
[5]: https://stedolan.github.io/jq/download/
[6]: https://docs.github.com/en/rest/reference/actions#create-a-workflow-dispatch-event
[7]: https://github.com/batavicaludos/experience-update-trigger/tree/main/actions
[8]: https://github.com/batavicaludos/experience-update-trigger/issues/new
