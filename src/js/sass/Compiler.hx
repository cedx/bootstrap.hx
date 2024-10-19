package js.sass;

import js.lib.Promise;

/** Asynchronously compiles Sass stylesheets to CSS. **/
extern class AsyncCompiler {

	/** Compiles the Sass file at the specified `path` to CSS. **/
	function compileAsync(path: String, ?options: Options): Promise<CompileResult>;

	/** Ends the lifespan of this compiler. **/
	function dispose(): Promise<Void>;
}

/** Synchronously compiles Sass stylesheets to CSS. **/
extern class Compiler {

	/** Compiles the Sass file at the specified `path` to CSS. **/
	function compile(path: String, ?options: Options): CompileResult;

	/** Ends the lifespan of this compiler. **/
	function dispose(): Void;
}

/** The result of compiling Sass to CSS. **/
typedef CompileResult = {

	/** The generated CSS. **/
	var css: String;

	/** The source map that maps locations in the generated CSS back to the Sass source code. **/
	var ?sourceMap: {};
}
