# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Soxer is a file based static/dynamic web site creation tool for Sinatra"
HOMEPAGE="http://soxer.mutsu.org"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/sinatra-1"
ruby_add_rdepend ">=dev-ruby/haml-3"
ruby_add_rdepend ">=dev-ruby/sass-3"
ruby_add_rdepend ">=dev-ruby/uuid-2"
ruby_add_rdepend ">=dev-ruby/hashie-1.0.0"
ruby_add_rdepend ">=dev-ruby/sinatra-reloader-0.5"

