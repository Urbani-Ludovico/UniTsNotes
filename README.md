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
| courseType | bachelor | bachelor, master     | Course type code                                              |
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
```
with the arguments:
- environment name: the name to use in `\begin{} \end{}`.
- reference name: the prefix of the name to use in `\ref{}` or `\autoref{}`. For example with reference name "th" and theorem code "test", the reference is `\ref{th:test}`.
- label: the label of the environment.
- color: color for box and title.
- style: more style in accord with tcolorbox documentation.

For each environment a proof environment will be created with the name "{env reference}-proof" with the same color. For example for environment "theorem", the proof environment is "theorem-proof".

Example of use:
```latex
\begin{theorem}{Test theorem}{test}
    This is a test theorem.
\end{theorem}

\begin{thproof}[proof-ref]{test}
    This is a proof for the test theorem.
\end{thproof}
```
For the theorem, first argument of the theorem is the label and the second is the reference name.
For the proof the optional argument (set only if necessary) is the reference of the proof, the second (if set) is the reference of the parent theorem (without the prefix).

### Available colors

- <span style="background: #222222; margin-right: 10px; padding-left: 1cm;"></span>thc-black
- <span style="background: #0000DD; margin-right: 10px; padding-left: 1cm;"></span>thc-blue
- <span style="background: #804000; margin-right: 10px; padding-left: 1cm;"></span>thc-brown
- <span style="background: #009999; margin-right: 10px; padding-left: 1cm;"></span>thc-cyan
- <span style="background: #606060; margin-right: 10px; padding-left: 1cm;"></span>thc-gray
- <span style="background: #00AA00; margin-right: 10px; padding-left: 1cm;"></span>thc-green
- <span style="background: #C000C0; margin-right: 10px; padding-left: 1cm;"></span>thc-magenta
- <span style="background: #EE7000; margin-right: 10px; padding-left: 1cm;"></span>thc-orange
- <span style="background: #DD0000; margin-right: 10px; padding-left: 1cm;"></span>thc-red
- <span style="background: #800080; margin-right: 10px; padding-left: 1cm;"></span>thc-violet