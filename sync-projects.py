#!/usr/bin/env python3

import subprocess
import sys
from subprocess import PIPE

projects_links = []
with open("projects.txt") as file:
    projects_links = file.readlines()


def exe(args, location, suppress):
    command = subprocess.run(args, stdout=PIPE, stderr=PIPE, cwd = location)
    if command.returncode != 0 and not suppress:
        print(command.stdout)
        print(command.stderr)
        exit(1)


def push(links):
    for link in links:
        exe(['git', 'commit', '-am', '"automatical commit"'], link.strip(),True)
        exe(['git','push'], link.strip(),False)
        print('%s has pushed successfully'%link.strip())


def pull(links):
    for link in links:
        exe(['git', 'pull'], link.strip(),True)
        print('%s has pulled successfully'%link.strip())


all_commands = [
    'pull', 'push'
]


if __name__ == '__main__':
    action = 'yummy'
    if len(sys.argv) >= 2:
        action = sys.argv[1]
    if not action in all_commands:
        print('accepted arguments: pull, push.')
        exit(1)

    if action == 'pull':
        pull(projects_links)
    elif action == 'push':
        push(projects_links)
    exit(0)
