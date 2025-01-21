/** Packages the project. **/
function main()
	for (script in ["Clean", "Version", "Build"]) Sys.command('lix $script');
