# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="The Godfather of Sinatra provides a full-stack agnostic framework on top of Sinatra"
HOMEPAGE="http://www.padrinorb.com"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend "=dev-ruby/padrino-admin-0.12.2"
ruby_add_rdepend "=dev-ruby/padrino-cache-0.12.2"
ruby_add_rdepend "=dev-ruby/padrino-core-0.12.2"
ruby_add_rdepend "=dev-ruby/padrino-gen-0.12.2"
ruby_add_rdepend "=dev-ruby/padrino-helpers-0.12.2"
ruby_add_rdepend "=dev-ruby/padrino-mailer-0.12.2"
ruby_add_rdepend "=dev-ruby/padrino-support-0.12.2"

