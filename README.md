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

### Theorem options

| Option           | Environment |
| ---------------- | ----------- |
| stylealgorithm   | algorithm   |
| styledefinition  | definition  |
| stylelemma       | lemma       |
| styleobservation | observation |
| styleproof       | proof       |
| styleproperty    | property    |
| styleproposition | proposition |
| styletheorem     | theorem     |

## Theorem environment

By default, the available environments are:
- definition
- theorem
- observation
- lemma

To add more environments, there is the command:
```latex
\NewTcb
    {environment name}
    {reference name}
    {label}
    {style}
```

Most important style is `colframe=` that defines the color of the title.

The reference name is the code to use for references, for example with code `{th}` the reference to theorem "test" is `\ref{th:test}`.

The starred version `\NewTcb*` omit the number.

Example of use:
```latex
\begin{theorem}{Test theorem}{test}
    This is a test theorem.
\end{theorem}
```
where first argument is the label and the second is the reference name.

Base proof environment
```
\begin{theorem}{}{}
    This is a test theorem.
\end{theorem}
```
has only title "Proof". If is have to point to a theorem not directly abouce, the `theorem \ref{th:}` can be added as first argument.