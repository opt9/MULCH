;;;; This file is part of MULCH.
;;;;
;;;;MULCH is free software: you can redistribute it and/or modify
;;;;it under the terms of the GNU General Public License as published by
;;;;the Free Software Foundation, either version 3 of the License, or
;;;;(at your option) any later version.
;;;;
;;;;MULCH is distributed in the hope that it will be useful,
;;;;but WITHOUT ANY WARRANTY; without even the implied warranty of
;;;;MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;;;GNU General Public License for more details.
;;;;
;;;;You should have received a copy of the GNU General Public License
;;;;along with MULCH.  If not, see <http://www.gnu.org/licenses/>.

;;;; main.lisp

(in-package #:mulch)

;;; "MULCH" goes here. Hacks and glory await!
(load "server.lisp")

(defstruct room name light north east south west northeast southwest northwest southeast players objects )))) ;To prevent bugs with players and objects, create a "build-room" function that takes a name, setfs a var to the room, calls players-at and objects-at to define the objects and players....
(defun players-at-aux (location-name) (defparameter `,@(players-at-aux-1 location-name) (list nil))) ;This needs an aux function itself due to being a list....Ugly, I know....
(defun players-at-aux-1 (location-name) (concatenate 'string "players-" location-name))
(defun players-at (name-room list-players)
  (dolist (players-i (mapcar #'username-variable *registered-usernames*))
    (if (equalp (player-location players-i) name-room)
	(cons players-i (players-at-aux-1 name-room)))))
;Objects-at will probably have a cleaner design--I'll make an alist of objects and their locations, so it'll be easier to go through it...