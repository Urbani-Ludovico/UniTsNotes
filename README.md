# UniTsNotes

Base class for write UniTs notes in Latex.

## Options

### PDF options

| Option    | Default | Allowed values   | Description                                   |
| --------- | ------- | ---------------- | --------------------------------------------- |
| language  | english | english, italian | Document language                             |
| papersize | a4paper |                  | For allowed valye see geometry package manual |
| side      | twoside | oneside, twoside |                                               |

### Content options

| Option     | Default  | Allowed values       | Description                                                   |
| ---------- | -------- | -------------------- | ------------------------------------------------------------- |
| authors    |          |                      | Authors lists                                                 |
| course     |          |                      | Course name                                                   |
| coursetype | bachelor | bachelor, master     | Course type code                                              |
| department |          | deams, df, dia, mige | Department code for set the loro, if empty UniTs logo is used |
| teachers   |          |                      | Teachers name, with prefix                                    |
| teaching   |          |                      | Teaching name                                                 |
| year       |          |                      | Academic year                                                 |
