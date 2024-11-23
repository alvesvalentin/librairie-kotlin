package fr.lille.octo.library

import org.springframework.boot.fromApplication
import org.springframework.boot.with


fun main(args: Array<String>) {
	fromApplication<LibraryApplication>().with(TestcontainersConfiguration::class).run(*args)
}
