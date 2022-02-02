/** Runs the script. **/
function main()
	for (script in ["Clean", "Version", "Build"]) Sys.command('lix $script');
