# github_search

A simple application to search the github repository.
It allows user to input a GitHub repository name in the following format: “<owner>/<repository>“, e.g. “bright/shouldko”.

Repository for downloading github data.

## How to run 💻

**❗ In the root of project.**

Install packages:

```sh
flutter packages get
```

Run the app

```sh
flutter run lib/main.dart -d chrome
```

---

## Overview:

Main branch shows current progress of task.

- PR main-8 shows progress at 8h
- PR main-12 shows progress at 12h

I decided to do this because at 8h the backend was being done, but with the UI there wasn't much of it.

And I know, the UI is ugly but for me and for now it is not part of the task.

---

## Bugs:

- Cache

HydratedBloc works strangely on the web version. While the application is running, the cache works properly but it is empty after launch. I haven't had time to debug the problem.

---

## List of features & overview:

When the repository name is provided, the app fetches and displays the following information about it using GitHub API:

- [x] repository ID,
- [x] the list of the commits in the repository:
  - [x] each commit should be described by: message, SHA value, author’s name;
  - [x] the list should be sorted by date so that the latest commits are at the top (just like on GitHub).
- [x] The app caches the previously used repositories data.
  - [x] The user can access the history of last used repositories.
    - [x] Using the history, the user can open the repository information again in the same way as if he typed the repository name manually again (see: 1.)
  - [x] When the app is offline, the user should still be able to see the previously fetched repository information.
- [x] User can send the selected commits’ data (message, SHA value, author’s name) using 3rd party application installed on the phone (e.g. an e-mail client or Facebook Messenger) in the following way:
  - [x] the commits on the list can be selected and unselected,
  - [x] user selects at least one commit on the list,
  - [x] user taps a “send” button,
  - [x] user is asked by the system to choose an application he wants to use for sending a message,
  - [x] a new message in the selected app already contains passed commits’ information so that the user does not have to copy-paste it manually.
