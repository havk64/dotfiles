#!/bin/sh

FIFO=mfifo
PORT=12345

nc -lk ${PORT} <${FIFO} | nc -U ${SSH_AUTH_SOCK} >${FIFO} &
