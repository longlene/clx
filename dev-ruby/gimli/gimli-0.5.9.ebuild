# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Utility for converting markup files to pdf files"
HOMEPAGE="https://github.com/walle/gimli"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/github-markup-1.3"
ruby_add_rdepend ">=dev-ruby/redcarpet-3.2"
ruby_add_rdepend ">=dev-ruby/RedCloth-4.2.7"
ruby_add_rdepend ">=dev-ruby/coderay-1.1"
ruby_add_rdepend ">=dev-ruby/nokogiri-1.6.3"
ruby_add_rdepend ">=dev-ruby/wkhtmltopdf-binary-0.9.9.3"
ruby_add_rdepend ">=dev-ruby/optiflag-0.7"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rspec-0"
ruby_add_rdepend ">=dev-ruby/rr-0"
ruby_add_rdepend ">=dev-ruby/bundler-0"

