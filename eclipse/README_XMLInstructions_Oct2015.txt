README - BLM Wyoming Downloadable Data in XML Workspace Document Format

Instructions:  How to import an XML Workspace Document in ESRI ArcGIS

Many BLM authored GIS datasets are available for download from the Wyoming BLM website as an XML Workspace Document.  This format is a convenient way to package geodatabase feature classes and feature datasets, as it consolidates the disparate files of the geodatabase format into a single compressed file.  While this format may not be familiar to casual users of GIS software, it is very easy to import into a usable format.  The following instructions will guide you through the process of importing via ArcGIS.

1 - Download the zipped XML Workspace Document from the BLM download site and save the zip file to a familiar location.  Extract the XML Workspace Document from the zip file using right-click, scroll down to "Extract All", and select your desired folder location for the XML Workspace Document.

2 - Open ESRI ArcCatalog.

3 - Navigate to the folder location you would like the data to reside, and create a new geodatabase (a file geodatabase is preferable, but you can use a personal geodatabase if necessary).  Be sure to rename your new geodatabase.

4 - Right click on the new geodatabase, scroll down to the "Import" option, and select "XML Workspace Document".

5 - The Import XML Workspace Document dialog box will appear.  Under the heading "What do you want to import:", make sure that "Data" is selected.  Click the open folder button to the right of the "Specify the XML source to import:" box.

6 - Navigate to the location where you saved the XML, and select the XML Workspace Document.  Press "Open".

7 - The file path will now be filled in.  Press "Next".  The next screen is a review of the feature class naming conflicts, none of which should exist in the download.  Press "Finish".  The import will now begin.  It will take up to a few minutes to import the data, and you can monitor the progress on the "XML Import Workspace" dialog box that appears.  Please be aware that this is not a background process, so none of the other functions and tools in ArcCatalog will be available until the import is complete.

8 - Upon completion, your ArcCatalog session will take you to the geodatabase with all the data imported as feature classes.  The data is now ready for use in ArcGIS.

If you have any questions, concerns, or find any discrepancies in the data, metadata, or these instructions, please contact the designated POC at the BLM Wyoming State Office as indicated in the metadata link at the download site.