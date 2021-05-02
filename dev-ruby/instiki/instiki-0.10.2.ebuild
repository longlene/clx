# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Instiki is a Wiki Clone written in Ruby that ships with an embedded  webserver"
HOMEPAGE="http://www.instiki.org"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend "=dev-ruby/madeleine-0.7.1"
ruby_add_rdepend "=dev-ruby/RedCloth-3.0.3"
ruby_add_rdepend "=dev-ruby/rubyzip-0.5.8"
ruby_add_rdepend "=dev-ruby/rails-0.13.1"

