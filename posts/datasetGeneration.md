# Dataset generation

For this particular problem, we are supposed to generate a custom dataset of web components so that we can support multiple numerous web components out of the box. For example, a simple rectangle can communicate that we have a UI block, but that UI component can be a text block, an image of a person, an embedded video or a simple blank space for aesthetics.

To generate the dataset, we're using a unique approach. We're not creating the dataset by hand as it would take significant time in making sketches of components, adding variations to them, and then labelling them for the algorithm. 

We're generating the dataset using a popular JS library called [rough.js](https://roughjs.com/) which allows creation of svgs that look like hand-drawn sketches. This solves multiple problems and greatly accelerates the speed of the process as we can programmatically bypass lot of manual work like [labelling](https://github.com/tzutalin/labelImg).

Currently the process that we are using is:
1. a static site that generates a particular component in the browser
2. a bot that repeatedly hits the above site and generates a new sample and downloads it, alongwith the coordinates
3. the bot generates the labelling data and saves the imaage.
4. the above is repeated hundreds of times to create a large dataset for each component.