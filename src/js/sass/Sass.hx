package js.sass;

import js.lib.Promise;

/** Compiles Sass stylesheets to CSS. **/
@:jsRequire(#if sass_embedded "sass-embedded" #else "sass" #end)
extern class Sass {

	/** Synchronously compiles the Sass file at the specified `path` to CSS. **/
	static function compile(path: String, ?options: Options): Compile.CompileResult;

	/** Asynchronously compiles the Sass file at the specified `path` to CSS. **/
	static function compileAsync(path: String, ?options: Options): Promise<Compile.CompileResult>;

	/** Creates a synchronous compiler. **/
	static function initCompiler(): Compile.Compiler;

	/** Creates an asynchronous compiler. **/
	static function initAsyncCompiler(): Promise<Compile.AsyncCompiler>;
}
