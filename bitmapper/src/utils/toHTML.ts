export const template = `
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Render Template</title>
    </head>
                
    <body>
        <div id="container">
            <svginjection>
        </div>
    </body>
</html>
`;

export const toHTML = (svgData: string): string =>
        template.replace("<svginjection>", svgData);
