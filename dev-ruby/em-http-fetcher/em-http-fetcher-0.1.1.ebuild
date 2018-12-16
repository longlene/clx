# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="HTTP fetch client based on ruby EventMachne and EM-HTTP-Request that has configureable concurrency regardless of EM's thread pool"
HOMEPAGE="http://github.com/sugi/em-http-fetcher"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/addressable-2.2.3"
ruby_add_rdepend ">=dev-ruby/em-http-request-1.0.0"

