# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Fix an exploitable bug in CGI multipart parsing"
HOMEPAGE="http://blog.evanweaver.com/pages/code#cgi_multipart_eof_fix"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""


