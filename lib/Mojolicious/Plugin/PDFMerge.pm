package Mojolicious::Plugin::PDFMerge;

use Mojo::Base 'Mojolicious::Plugin';
use Mojolicious::Plugin::PDFMerge::Data;
use Mojolicious::Plugin::RenderFile;
use File::Basename qw( dirname );
use Path::Class qw( dir );

# ABSTRACT: Web interface for merging PDF documents.
# VERSION

sub register
{
  my($self, $app, $conf) = @_;

  $app->plugin('RenderFile');

  my $plugin_home = dir(dirname(__FILE__), 'PDFMerge')->absolute;
  push @{ $app->static->paths }, $plugin_home->subdir('public')->stringify;
  push @{ $app->renderer->paths }, $plugin_home->subdir('templates')->stringify;

  my $r = $app->routes;

  $r->get('/pdf')->name('pdf_list')->to('controller#pdf_list', namespace => __PACKAGE__);

  $r->get('/pdf/#filename.pdf')->name('pdf_download')->to('controller#pdf_download', namespace => __PACKAGE__);

  $r->post('/pdf/merge')->name('pdf_merge_form')->to('controller#pdf_merge_form', namespace => __PACKAGE__);

  $r->get('/pdf/merge/*pdf_list')->name('pdf_merge')->to('controller#pdf_merge', namespace => __PACKAGE__);

  $app->helper(pdf => sub {
    state $data;
    $data //= Mojolicious::Plugin::PDFMerge::Data->new;
  });
}

1;


=head1 SYNOPSIS

1. Create a Mojolicious app with this plugin

 use Mojolicious::Lite
 plugin 'PDFMerge';
 app->start;

2. Start the app

 % ./myapp.pl

3. then point your browser to

=over 4

=item * http://localhost:3000/pdf

=back

=head1 DESCRIPTION

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

=head1 SEE ALSO

L<Mojolicious::Plugin::PDFMerge::Data>,
L<Mojolicious::Plugin::PDFMerge::Controller>,
L<Mojolicious>

=cut

