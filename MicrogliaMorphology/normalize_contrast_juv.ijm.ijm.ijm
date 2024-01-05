function action(input, output, filename) {
        open(input + filename);
        run("Subtract Background...", "rolling=20");
        run("Unsharp Mask...", "radius=50 mask=0.60");
        run("Enhance Contrast...", "saturated=0.70 normalize");
        run("Despeckle");
        saveAs("Tiff", output + filename);
        close();
}

input = "C:/Users/Ellen2/Documents/microglia_morphology_analysis/juv_tiff/";
output = "C:/Users/Ellen2/Documents/microglia_morphology_analysis/juv_tiff_processed/";

setBatchMode(true); 
list = getFileList(input);
for (i = 0; i < list.length; i++){
        action(input, output, list[i]);
}
setBatchMode(false);