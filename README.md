# Mojolicious::Plugin::PDFMerge

Web interface for merging PDF documents.

# SYNOPSIS

1\. Create a Mojolicious app with this plugin

    use Mojolicious::Lite
    plugin 'PDFMerge';
    app->start;

2\. Start the app

    % ./myapp.pl daemon

3\. then point your browser to

- http://localhost:3000/pdf

# DESCRIPTION

This plugin provides a web interface for merging multiple
PDF documents so they can be sent to a printer for physical
copies.

My apartment doesn't have room for a printer (not with all my
junk which is apparently more important), so when I need to print
something I use a virtual PDF printer (cups-pdf in Debian, other
distributions and operating systems probably have similar packages)
and take the PDFs to FedEx Office.  Unfortunately the self service
facility for printing multiuple PDFs has a sucky interface so it
is better to go there with one big PDF rather than many little
PDFs.  The intent is to use the virtual PDF printer to print to
~/PDF, and then merge them with this web application into a single
PDF which I save to the memory stick which I take to the FedEx
Office.

The application is implemeted with  Mojolicious, plus a few other
modules available on CPAN.

# SEE ALSO

[Mojolicious::Plugin::PDFMerge::Data](https://metacpan.org/pod/Mojolicious::Plugin::PDFMerge::Data),
[Mojolicious::Plugin::PDFMerge::Controller](https://metacpan.org/pod/Mojolicious::Plugin::PDFMerge::Controller),
[Mojolicious](https://metacpan.org/pod/Mojolicious)

# AUTHOR

Graham Ollis <plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
