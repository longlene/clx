# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

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


