# github_search
A simple application to search the github repository.
It allows user to input a GitHub repository name in the following format: “<owner>/<repository>“, e.g. “bright/shouldko”.


List of features & overview:


When the repository name is provided, the app fetches and displays the following information about it using GitHub API:
- [ ] repository ID,
- [ ] the list of the commits in the repository:
    - [ ] each commit should be described by: message, SHA value, author’s name;
    - [ ] the list should be sorted by date so that the latest commits are at the top (just like on GitHub).
- [ ] The app caches the previously used repositories data.
    - [ ] The user can access the history of last used repositories.
        - [ ] Using the history, the user can open the repository information again in the same way as if he typed the repository name manually again (see: 1.)
    - [ ] When the app is offline, the user should still be able to see the previously fetched repository information.
- [ ] User can send the selected commits’ data (message, SHA value, author’s name) using 3rd party application installed on the phone (e.g. an e-mail client or Facebook Messenger) in the following way:
    - [ ] the commits on the list can be selected and unselected,
    - [ ] user selects at least one commit on the list,
    - [ ] user taps a “send” button,
    - [ ] user is asked by the system to choose an application he wants to use for sending a message,
    - [ ] a new message in the selected app already contains passed commits’ information so that the user does not have to copy-paste it manually.