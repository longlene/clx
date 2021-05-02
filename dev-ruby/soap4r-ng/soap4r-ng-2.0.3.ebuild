# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Soap4R NextGen (as maintained by RubyJedi) for Ruby 1"
HOMEPAGE="http://rubyjedi.github.io/soap4r/"

LICENSE="Ruby"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/httpclient-2.6"
ruby_add_rdepend ">=dev-ruby/logger-application-0.0.2"

