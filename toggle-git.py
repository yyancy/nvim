#!/usr/bin/env python3

import subprocess
import sys


def toggle_github(action: str):
    current_dir = subprocess.run(
        ['git', 'config', '--list'], capture_output=True, text=True)
    found = current_dir.stdout.find('cnpmjs.org')
    if found == -1 and action == 'add':
        current_dir = subprocess.run(
            ['git', 'config', '--global', 'url.https://github.com.cnpmjs.org.insteadOf', 'https://github.com'])
    elif found != -1 and action == 'delete':
        current_dir = subprocess.run(
            ['git', 'config', '--global', '--unset', 'url.https://github.com.cnpmjs.org.insteadOf'])
    elif action == 'show':
        print(current_dir.stdout)

"""
add github alternate website.

default command is show, which show all current configurations globally.
add command will add github alternate website configuration; delete command vice versa.
"""
all_commands = ['show', 'add', 'delete']
if __name__ == '__main__':
    action = 'show'
    if len(sys.argv) >= 2:
        action = sys.argv[1]
    if not action in all_commands:
        print('accepted arguments: show, add, delete. default action show.')
        exit(1)

    toggle_github(action)
    exit(0)
