# ЛРК

_Листоробка_ — from _листок_ "slip" and _коробка_ "box". Calque of German _Zettelkasten_

LRK is a collection of note-management scripts inspired by the 70s.

## Installation

```sh
make [PREFIX=/usr/local/bin]
```

## Usage

Set the `LRK_DIR` environment variable to your desired directory. The default is `$HOME/.lrk`.

Create a note:

```sh
lrk add "Note Title" --tags "tag1,tag2"
```

List notes:

```sh
lrk list --all --tags "tag1" --sort date
```

Find notes:

```sh
lrk find "Note Title" --tags "tag1" --date "2025-10-01"
```

Open a note:

```sh
lrk open 123 --editor vim
```

Delete a note:

```sh
lrk delete 123
```

Archive a note:

```sh
lrk archive 123
```

Unarchive a note:

```sh
lrk unarchive 123
```

Show backlinks:

```sh
lrk backlinks 123
```

## Integration

LRK can be integrated with other tools such as Kakoune or Zellij. Take a look at my configuration to see an example.
