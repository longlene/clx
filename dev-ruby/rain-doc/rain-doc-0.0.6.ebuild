# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Rain is a gem to generate beautiful and customizable API documentation, inspired by yard and rdoc"
HOMEPAGE="http://martin-brennan.github.io/rain/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend "=dev-ruby/rspec-3.1.0"
ruby_add_rdepend "=dev-ruby/guard-rspec-4.5.0"
ruby_add_rdepend "=dev-ruby/thor-0.19.1"

