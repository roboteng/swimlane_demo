# swimlane_demo

Checking different swimlane approaches

## iOS/VoiceOVer

As far as VoiceOver is concerned, I was not able to tell a difference between these. The layout
differences are still present, but I will explain that later in the Layout Section. 

Everything scrolls as expected. VoiceOver does not try to scroll in the swimlanes to find the next heading,
it just moves focus in the main scroll direction.

There is no indication of how far along the swimlane the user is. 

## Android/TalkBack

### Row

TalkBack does not announce a "showing 1 to 3 of 10" style message by default.

The earcons that are presented ar all the same pitch.

### ListView/ListView.builder

TalkBack does announce "showing 1 to 3 of 10" as well as ascending pitches for the earcons.

## Layout

Row builds its children before returning its size to its parent.  This means that it can calculate its size based on its children.
Consequently, the height of the Row does not need to be specified in code, as it will shrink to is largest child.

The ListViews return their size independent of their children. This means that we need to hardcode its height.

This could cause problems if we are not sure of the size of the children ahead of time.  An instance of this might be
when the user changes the system font size, the size of the children will change.

Using SliverPrototypeExtentList Seems to behave the same as a ListView, as long as semanticChildCount has been provided

## tl;dr

Rows are less accessibility rich, but more predictable in layouts
