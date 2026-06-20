# UniTsNotes

Base class for write UniTs notes in Latex.

## Options

### PDF options

| Option    | Default | Allowed values   | Description                                   |
| --------- | ------- | ---------------- | --------------------------------------------- |
| language  | english | english, italian | Document language                             |
| papersize | a4paper |                  | For allowed value see geometry package manual |
| side      | twoside | oneside, twoside |                                               |

### Content options

| Option     | Default  | Allowed values       | Description                                                   |
| ---------- | -------- | -------------------- | ------------------------------------------------------------- |
| authors    |          |                      | Authors lists                                                 |
| course     |          |                      | Course name                                                   |
| coursetype | bachelor | bachelor, master     | Course type code                                              |
| department |          | deams, df, dia, mige | Department code for set the logo, if empty UniTs logo is used |
| teachers   |          |                      | Teachers name, with prefix                                    |
| teaching   |          |                      | Teaching name                                                 |
| year       |          |                      | Academic year                                                 |

### Theorem options

| Option            | Description           |
| ----------------- | --------------------- |
| definitionColor   | Color of definition   |
| theoremColor      | Color of theorem      |

## Theorem environment

By default, the available environments are:
<ul>
    <li>
        <code>definition</code>
        <ul>
            <li>label: "Definition"</li>
            <li>reference prefix: "def"</li>
            <li>default color: blue!80!white</li>
        </ul>
    </li>
    <li>
        <code>theorem</code>
        <ul>
            <li>label: "Theorem"</li>
            <li>reference prefix: "th"</li>
            <li>default color: red!90!black</li>
        </ul>
    </li>
    <li>
        <code>thproof</code>
        <ul>
            <li>label: "Proof"</li>
            <li>reference prefix: "thproof"</li>
            <li>default color: red!90!black</li>
            <li>not numbered</li>
        </ul>
    </li>
</ul>

To add more environments, there are the commands:
```latex
% Base environment
\NewTh
    {environment name}
    {reference name}
    {label}
    {color}
    {style}

% Omit the number
\NewTh*
    {environment name}
    {reference name}
    {label}
    {color}
    {style}

% Proof
\NewThProof
    {environment name}
    {reference name}
    {label}
    {color}
    {style}
```
with the arguments:
- environment name: the name to use in `\begin{} \end{}`.
- reference name: the prefix of the name to use in `\ref{}` or `\autoref{}`. For example with reference name "th" and theorem code "test", the reference is `\ref{th:test}`.
- label: the label of the environment.
- color: color for box and title.
- style: more style in accord with tcolorbox documentation.

Example of use:
```latex
\begin{theorem}{Test theorem}{test}
    This is a test theorem.
\end{theorem}
```
where first argument is the label and the second is the reference name.

Base proof environment
```latex
\begin{thproof}{}{}
    This is a proof for the test theorem.
\end{thproof}
```
has only title "Proof". If is have to point to a theorem not directly above, the `theorem \ref{th:}` title can be added as first argument.