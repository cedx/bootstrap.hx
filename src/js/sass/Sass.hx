package js.sass;

import js.lib.Promise;

/** Compiles Sass stylesheets to CSS. **/
@:jsRequire("sass-embedded")
extern class Sass {

	/** Synchronously compiles the Sass file at the specified `path` to CSS. **/
	static function compile(path: String, ?options: Options): Compiler.CompileResult;

	/** Asynchronously compiles the Sass file at the specified `path` to CSS. **/
	static function compileAsync(path: String, ?options: Options): Promise<Compiler.CompileResult>;

	/** Creates a synchronous compiler. **/
	static function initCompiler(): Compiler;

	/** Creates an asynchronous compiler. **/
	static function initAsyncCompiler(): Promise<Compiler.AsyncCompiler>;
}
